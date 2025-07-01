#!/bin/bash

# Random Pop Culture Name Generator
# Returns one of 100 pop culture names randomly

set -e

# Array of 100 pop culture names
names=(
    # Movie/TV Characters (25)
    "Luke Skywalker"
    "Darth Vader"
    "Harry Potter"
    "Hermione Granger"
    "Walter White"
    "Tony Soprano"
    "Michael Scott"
    "Tyrion Lannister"
    "Eleven"
    "The Mandalorian"
    "Captain Jack Sparrow"
    "Indiana Jones"
    "James Bond"
    "The Terminator"
    "Ellen Ripley"
    "Neo"
    "Trinity"
    "Morpheus"
    "Gandalf"
    "Frodo Baggins"
    "Sherlock Holmes"
    "Doctor Watson"
    "Hannibal Lecter"
    "The Joker"
    "Tyler Durden"
    
    # Musicians/Artists (20)
    "Elvis Presley"
    "The Beatles"
    "Michael Jackson"
    "Madonna"
    "Prince"
    "David Bowie"
    "Freddie Mercury"
    "Beyoncé"
    "Taylor Swift"
    "Eminem"
    "Jay-Z"
    "Bob Dylan"
    "John Lennon"
    "Paul McCartney"
    "Jimi Hendrix"
    "Kurt Cobain"
    "Amy Winehouse"
    "Frank Sinatra"
    "Johnny Cash"
    "Whitney Houston"
    
    # Superheroes/Villains (20)
    "Batman"
    "Superman"
    "Spider-Man"
    "Iron Man"
    "Captain America"
    "Wonder Woman"
    "Black Widow"
    "The Hulk"
    "Thor"
    "Loki"
    "Black Panther"
    "Doctor Strange"
    "Wolverine"
    "Deadpool"
    "The Flash"
    "Aquaman"
    "Thanos"
    "Magneto"
    "Professor X"
    "Harley Quinn"
    
    # Video Game Characters (15)
    "Mario"
    "Luigi"
    "Princess Zelda"
    "Link"
    "Sonic"
    "Master Chief"
    "Lara Croft"
    "Kratos"
    "Nathan Drake"
    "Solid Snake"
    "Cloud Strife"
    "Samus Aran"
    "Gordon Freeman"
    "Geralt of Rivia"
    "Aloy"
    
    # Classic Characters (10)
    "Mickey Mouse"
    "Bugs Bunny"
    "Homer Simpson"
    "Bart Simpson"
    "SpongeBob"
    "Scooby-Doo"
    "Charlie Brown"
    "Garfield"
    "Winnie the Pooh"
    "Pikachu"
    
    # Modern Icons (10)
    "Baby Yoda"
    "Elsa"
    "Shrek"
    "Woody"
    "Buzz Lightyear"
    "Jack Skellington"
    "Edward Cullen"
    "Katniss Everdeen"
    "Jon Snow"
    "Rick Sanchez"
)

# Get array length
total_names=${#names[@]}

# Generate random index
random_index=$(( RANDOM % total_names ))

# Output the random name
echo "${names[$random_index]}"