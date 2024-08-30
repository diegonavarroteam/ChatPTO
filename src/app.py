from dotenv import load_dotenv
from langchain_core.messages import AIMessage, HumanMessage
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.runnables import RunnablePassthrough
from langchain_core.output_parsers import StrOutputParser
from langchain_community.utilities import SQLDatabase
from langchain_community.tools import InfoSQLDatabaseTool
from langchain.prompts import ChatPromptTemplate
from langchain_groq import ChatGroq
import streamlit as st

# Load environment variables
load_dotenv()

#Initialize UI
st.set_page_config(page_title="Chat PTO", page_icon=":speech_balloon")
st.title("Chat PTO")
user_query = st.chat_input("Type a message...")

# Initialize Session States
if 'User' not in st.session_state:
    st.session_state['User'] = "gpt_user"

if 'Password' not in st.session_state:
    st.session_state['Password'] = "MyPassword"

if 'Host' not in st.session_state:
    st.session_state['Host'] = "localhost"

if 'Port' not in st.session_state:
    st.session_state['Port'] = 3306

if 'Database' not in st.session_state:
    st.session_state['Database'] = "team_ptos"

if "chat_history" not in st.session_state:
    st.session_state.chat_history = [
      AIMessage(content="Hello! I'm a TEAM assistant. Ask me anything about your PTO's."),
    ]

if 'Schema' not in st.session_state:
    st.session_state['Schema'] = None

if 'Email' not in st.session_state:
    st.session_state['Email'] = None

if 'db' not in st.session_state:
    st.session_state['db'] = None

def init_database(user: str, password: str, host: str, port: str, database: str) -> SQLDatabase:
    db_uri = f"mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database}"
    return SQLDatabase.from_uri(db_uri)

def get_reduced_schema(db):
    if st.session_state.Schema is None:
        table_names = "client, employee, ptobalance, ptorequest"
        tool = InfoSQLDatabaseTool(db=db)
        st.session_state['Schema'] = tool._run(table_names)

    return st.session_state.Schema

def get_sql_script():
    generate_script_prompt = ChatPromptTemplate.from_template("""
        You are a assistant data analyst at a company, specializing in SQL queries and database management. You interact with users who ask questions about the company’s database.
        Based on the provided table schema, generate a SQL query that accurately answers the user's question. 
        Your query should focus solely on reading data related to the employee.Email {user_email}. 
        
        Consider the entire conversation history to ensure the query aligns with the user's context and intent.
        
        <SCHEMA>{schema}</SCHEMA>
        Conversation History: {chat_history}
        
        Write only the SQL query and nothing else. Do not wrap the SQL query in any other text, not even backticks.

        For example:
        Q: How many available PTO's do I have?
        A: SELECT ptobalance.AvailablePTO FROM ptobalance JOIN employee ON ptobalance.EmployeeID = employee.EmployeeID WHERE employee.Email = '{user_email}';
        Q: Someone from my team ask for a PTO request for 2024-11-20?
        A: SELECT employee.FirstName, employee.LastName, client.Name, COUNT(*) FROM ptorequest JOIN employee ON ptorequest.EmployeeID = employee.EmployeeID JOIN client ON client.ClientID = employee.ClientID WHERE employee.ClientID = (SELECT employee.ClientID FROM employee WHERE employee.Email = '{user_email}') and employee.Email != '{user_email}' and '2024-11-20' BETWEEN ptorequest.StartDate and ptorequest.EndDate GROUP BY employee.FirstName, employee.LastName, client.Name;
        Q: What is my team?
        A: SELECT employee.Name FROM employee WHERE employee.Email = '{user_email}'
                                                                                                                                                                          
        Q: {question}
        A:
        """
    )

    # Set up Groq
    llm = ChatGroq(model="mixtral-8x7b-32768", temperature=0, max_tokens=None, timeout=None, max_retries=2)
    
    return (
        generate_script_prompt
        | llm
        | StrOutputParser()
    )

def get_response(user_query: str, db: SQLDatabase, chat_history: list, user_email: str):
    sql_chain = get_sql_script()

    generate_user_response_prompt = ChatPromptTemplate.from_template("""
        You are an assistant data analyst at a company, specializing in SQL queries and database management. Your task is to respond to user queries based on the company's database.
        Given the table schema, the user's question, the SQL query generated, and the query's result, craft a clear and informative natural language response to the user. 
        Do not show process, breakdown or SQL source, just the answer.
                                                                     
        <SCHEMA>{schema}</SCHEMA>
        Conversation History: {chat_history}
        SQL Query: <SQL>{query}</SQL>
        User Question: {question}
        SQL Response: {response}
        """
    )
    
    llm = ChatGroq(model="mixtral-8x7b-32768", temperature=0)
    
    chain = (
        RunnablePassthrough.assign(query=sql_chain).assign(
            response=lambda vars: db.run(vars["query"]),
        )
        | generate_user_response_prompt
        | llm
        | StrOutputParser()
    )
    
    return chain.invoke({
        "question": user_query,
        "chat_history": chat_history,
        "schema": get_reduced_schema(db),
        "user_email": user_email
    })

def get_user_data():
    if st.session_state.Email is not None and st.session_state.db is not None:
        db = st.session_state.db
        user_data = db.run("SELECT employee.FirstName, employee.LastName FROM team_ptos.employee where employee.Email = '" + st.session_state.Email + "'")
        if user_data != "":
            userDataList = eval(user_data)
            firstUser = userDataList[0]
            st.session_state.FirstName = firstUser[0]
            st.session_state.LastName = firstUser[1]
        else:
            st.session_state.FirstName = ""
            st.session_state.LastName = ""
            st.error("User does not exists", icon="🚨")

with st.sidebar:
    col1, col2 = st.columns(2)
    with col1:
        st.image("C:\git\Training\AI\ChatPTO\src\images\logoTeam.png", width=160)
    with col2:
        st.image("C:\git\Training\AI\ChatPTO\src\images\paperPlane.png", width=80)
    st.subheader("", divider="orange")
    st.write("Please connect first to the database!")
    if st.button("Connect"):
       with st.spinner("Connecting to the database..."):
            db = init_database(
                st.session_state["User"],
                st.session_state["Password"],
                st.session_state["Host"],
                st.session_state["Port"],
                st.session_state["Database"]
            )
            st.session_state.db = db
            txt="Connected to database! ✅"    
            htmlstr1=f"""<p style='background-color:green;
                color:white;
                font-size:1rem;
                border-radius:5px;
                line-height:60px;
                padding-left:17px;'>
                {txt}</style>
                <br></p>""" 
            st.markdown(htmlstr1,unsafe_allow_html=True) 

    st.subheader("", divider="orange")
    st.text_input("Email", key='Email', on_change=get_user_data)
    st.text_input("First Name", key="FirstName", disabled=True)
    st.text_input("Last Name", key="LastName", disabled=True)
    #st.error("User does not exists" )
    st.markdown("""
    <style>
        div.st-emotion-cache-6qob1r.eczjsme3 {
            color: white;
            background-color: black;
            primaryColor : white;
        }
        .stTextInput > label {
            font-size:120%; 
            font-weight:bold; 
            color:white; 
        }
        .stButton > button {
            color: white;
            background: orange;
            width: 100px;
            height: 50px;
        }
        .st-emotion-cache-13ejsyy:hover{
            border-color: orange;
            color:white; 
        }
    </style>
    """, unsafe_allow_html=True)

for message in st.session_state.chat_history:
    if isinstance(message, AIMessage):
        with st.chat_message("AI"):
            st.markdown(message.content)
    elif isinstance(message, HumanMessage):
        with st.chat_message("Human"):
            st.markdown(message.content)

if user_query is not None and user_query.strip() != "":
    st.session_state.chat_history.append(HumanMessage(content=user_query))

    with st.chat_message("Human"):
        st.markdown(user_query)
        
    with st.chat_message("AI"):
        response = get_response(user_query, st.session_state.db, st.session_state.chat_history, st.session_state.Email)
        st.markdown(response)

    st.session_state.chat_history.append(AIMessage(content=response))