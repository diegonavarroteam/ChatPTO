# ChatPTO

ChatPTO is a Python-based application that helps manage and track Paid Time Off (PTO) requests within an organization. The project uses MySQL databases to store employee information, PTO balances, and PTO requests. 

This demo of ChatPTO showcases an innovative feature that allows users to interact with the system using natural language. Through conversational AI, the application dynamically generates SQL queries, retrieves relevant data from the database, and presents the results in a user-friendly format. The integration of AI models, combined with a Streamlit-based graphical user interface, offers an intuitive and enhanced user experience.

## Features

- **PTO Questions**: Query and analyze PTO data for better decision-making.
- **Python-based**: Developed entirely in Python, adhering to best practices and leveraging modern technologies to ensure robust and maintainable code.
- **Streamlit GUI**: Offers an intuitive, user-friendly interface built with Streamlit, catering to users of all technical backgrounds.
- **Natural Language Processing**: Utilizes AI to accurately interpret and respond to user queries in natural language.
- **SQL Query Generation**: Automatically generates SQL queries from user input, translating natural language into precise database operations.
- **Database Interaction**: Seamlessly connects to a SQL database, retrieving and displaying query results to demonstrate real-world database integration.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Database Schema](#database-schema)
- [AI Integration](#ai-integration)
- [License](#license)

## Installation

To get started with ChatPTO, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/diegonavarroteam/ChatPTO.git
    ```

2. Navigate to the project directory:

    ```bash
    cd ChatPTO
    ```

3. Install the required dependencies:

    ```bash
    pip install -r requirements.txt
    ```
4. Configure your .env file with the necessary variables, including your API key:
   
    ```bash
    OPENAI_API_KEY=[your-openai-api-key]
    or
    GROQ_API_KEY=[your-groq-api-key]
    ```

6. Set up the database:

    - Ensure you have MySQL installed and running.
    - Run the querys in the folder src to create tables and data:

## Usage

1. Start the application:

    ```bash
    streamlit run .\src\app.py
    ```

2. Interact with the UI to fill an existing email like 'john.doe@acme.com' and click on Connect.

3. Write your PTO questions and wait for the answers.

## Database Schema

ChatPTO uses a relational database schema with the following tables:

- **client**: Stores client information.
- **employee**: Stores employee details such as name, contact information, and salary.
- **ptobalance**: Tracks the PTO balances for each employee.
- **ptorequest**: Stores PTO requests and their approval status.

This diagram was just design to recreate an initial Demo:

![screenshot](https://github.com/diegonavarroteam/ChatPTO/blob/main/src/images/DatabaseDiagram.png)

## AI Integration
Chat PTO operates by processing natural language queries submitted through the user interface (UI). Utilizing advanced AI tools such as OpenAI or Groq, these queries are translated into SQL queries. The system then executes the SQL query against the database to retrieve the relevant information. After obtaining the data, the AI tool is used once more to translate the query results into a natural language response, which is then presented to the user via the UI.

The interaction with the AI tool involves two distinct prompts: the first generates the SQL query to extract the necessary information from the database, and the second formulates a clear, natural language response to the user based on the data returned by the initial query. In both queries, we incorporate the database schema from the relevant tables as a foundational knowledge base for the AI tool. This ensures the generation of more accurate and contextually appropriate responses.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details. For testing pruporses you can use [Grooq](https://groq.com/) to generate a free API KEY to interact with the AI tool. 
