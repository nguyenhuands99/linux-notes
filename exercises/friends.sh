#! /bin/bash

friends=(Anh Bang Chau Duc "Van Em" "Thi Gai")

echo "My fifth friend is ${friends[4]}"

for friend in "${friends[@]}"
do
    echo friend: ${friend}
done

echo "I have ${#friends[*]} friends"

