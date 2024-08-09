# Import Library
import re
import os

# Paths
file_name = 'sakila.sql' # The SQL file to be split (customizable)
folder_name = 'MySQL Sample Database' # The folder where the SQL file is located (customizable)

current_path = os.getcwd()
folder_path = current_path + '\\' + folder_name
file_path = folder_path + '\\' + file_name
folders = []

# Read SQL File
with open(file_path,'r') as f:
    text = f.read()

# Get Text Pattern for Tables
table_name = re.findall('(?<=-- Table structure for )[\w]+', text) # Find table names
table_split_text = re.findall('CREATE TABLE[\s\S]+?;', text) # Find DDL script for the tables
folders.append('Tables') if len(table_name) != 0 else None

# Get Text Pattern for Views
view_name = re.findall('(?<=-- View structure for )[\w]+', text) # Find view names
view_split_text = re.findall('CREATE ALGORITHM[\s\S]+?;(?= ;)', text) # Find DDL script for the views
folders.append('Views') if len(view_name) != 0 else None

# Get Text Pattern for Functions
function_name = re.findall('(?<=-- Function structure for )[\w]+', text) # Find function names
function_split_text = re.findall('CREATE FUNCTION[\s\S]+?(?=;;)', text) # Find DDL script for the functions
folders.append('Functions') if len(function_name) != 0 else None

# Get Text Pattern for Procedures
procedure_name = re.findall('(?<=-- Procedure structure for )[\w]+', text) # Find procedure names
procedure_split_text = re.findall('CREATE PROCEDURE[\s\S]+?(?=;;)', text) # Find DDL script for the procedures
folders.append('Stored Procedures') if len(procedure_name) != 0 else None

# Get Text Pattern for Triggers
trigger_name = re.findall('(?<=CREATE TRIGGER `)[\w]+(?=`)', text) # Find trigger names
trigger_split_text = re.findall('CREATE TRIGGER[\s\S]+?(?=;;)', text) # Find DDL script for the triggers
folders.append('Triggers') if len(trigger_name) != 0 else None

# Create Folder If Not Exist
for folder in folders:
    if not os.path.exists(folder_path + '\\' + folder):
        os.makedirs(folder_path + '\\' + folder)

# Write The Separated Files for Tables, Views, Functions, Procedures, or Triggers
def write_files(folder:str, object_name:list, object_split_text:list):
    for i in range(len(object_name)):
        with open(folder_path+'\\'+folder+'\\'+object_name[i]+'.sql','w') as f:
            f.write(str(object_split_text[i]))

for folder in folders:
    if folder == 'Tables':
        write_files(folder, table_name, table_split_text)
    elif folder == 'Views':
        write_files(folder, view_name, view_split_text)
    elif folder == 'Functions':
        write_files(folder, function_name, function_split_text)
    elif folder == 'Stored Procedures':
        write_files(folder, procedure_name, procedure_split_text)
    elif folder == 'Triggers':
        write_files(folder, trigger_name, trigger_split_text)

print('The file splitting was successful!')