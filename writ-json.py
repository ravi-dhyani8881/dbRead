import re
import json

# Read SQL file
file_path = './db.sql'
with open(file_path, 'r') as file:
    sql_content = file.read()

# Initialize data structure
database_schema = {'tables': [], 'foreign_keys': []}

# Extract CREATE TABLE statements
create_table_patterns = re.findall(r'CREATE TABLE `(.*?)` \((.*?)\);', sql_content, re.DOTALL)
for table_name, table_body in create_table_patterns:
    table_info = {'name': table_name, 'columns': []}
    for column_definition in table_body.strip().split(','):
        table_info['columns'].append(column_definition.strip())
    database_schema['tables'].append(table_info)

# Extract ALTER TABLE statements
alter_table_patterns = re.findall(r'ALTER TABLE `(.*?)` ADD FOREIGN KEY \(`(.*?)`\) REFERENCES `(.*?)` \(`(.*?)`\);', sql_content)
for table_name, column_name, reference_table, reference_column in alter_table_patterns:
    foreign_key_info = {
        'table_name': table_name,
        'column_name': column_name,
        'reference_table': reference_table,
        'reference_column': reference_column
    }
    database_schema['foreign_keys'].append(foreign_key_info)

# Convert data structure to JSON
json_data = json.dumps(database_schema, indent=2)

# Write the JSON data to a file
output_file_path = 'output.json'
with open(output_file_path, 'w') as json_file:
    json_file.write(json_data)

print(f'JSON data written to {output_file_path}')
