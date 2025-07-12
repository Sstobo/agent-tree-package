#!/usr/bin/env python3

import random
import os
from datetime import datetime

def get_agent_assignment():
    """Return a random pop culture character name, current date, and current directory."""
    
    # 40 pop culture characters
    characters = [
        "Luke Skywalker", "Darth Vader", "Princess Leia", "Han Solo",
        "Sherlock Holmes", "Tony Stark", "Bruce Wayne", "Clark Kent",
        "Hermione Granger", "Harry Potter", "Gandalf", "Frodo Baggins",
        "Spider-Man", "Wonder Woman", "Captain America", "Black Widow",
        "Tyrion Lannister", "Jon Snow", "Daenerys Targaryen", "Arya Stark",
        "Walter White", "Jesse Pinkman", "Eleven", "Dustin Henderson",
        "Rick Sanchez", "Morty Smith", "Homer Simpson", "Bart Simpson",
        "Bugs Bunny", "Mickey Mouse", "Batman", "Superman",
        "Pikachu", "Ash Ketchum", "Master Chief", "Lara Croft",
        "Mario", "Link", "Sonic", "Pac-Man"
    ]
    
    # Get random character
    agent_name = random.choice(characters)
    
    # Get current date
    current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Get current directory
    current_dir = os.getcwd()
    
    # Format output
    output = f"""
AGENT ASSIGNMENT
================
Agent Name: {agent_name}
Current Date: {current_date}
Current Directory: {current_dir}
"""
    
    return output.strip()

if __name__ == "__main__":
    print(get_agent_assignment())