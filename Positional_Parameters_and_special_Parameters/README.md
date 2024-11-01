## Goal:
- The goal of this exercise is to create a shell script that adds users to the same Linux system as the
script is executed on. Additionally this script will conform to Linux program standard conventions.

# Positional parameters
- In a bash script, positional parameters (or arguments) are special variables that hold the values passed to the script or function when executed. Here's what they mean:
    1. `$0`: This is a special variable that represents the name of the script itself (or the command used to invoke it). For example, if you run ./myscript.sh arg1 arg2, `$0` will hold ./myscript.sh.
    2. `$1, $2, $3, ...`: These are positional parameters representing the arguments passed to the script. $1 holds the first argument, $2 holds the second, and so on. If you run ./myscript.sh arg1 arg2, $1 would be arg1, and $2 would be arg2.
    3. `$#`: This variable gives the total number of arguments passed to the script (excluding $0).
    4. `$@` and `$*`: Both hold all the arguments passed to the script, but they behave slightly differently:
        - $@ treats each quoted argument as a separate argument.
        - $* treats all arguments as a single string.
    5. `$?`: This holds the exit status of the last command that was executed. A status of 0 usually means success, while any non-zero status indicates an error.
    6. `$$`: This holds the process ID of the current shell running the script.
    7. `$!`: This holds the process ID of the last background command.


## Shift keyword:
- In bash scripting, shift is used to shift the positional parameters to the left. This effectively "discards" the first argument ($1) and moves each subsequent argument one position to the left. This is especially useful in scripts that need to process an unknown number of arguments or when handling arguments in a loop.

## How shift Works
- Initial Arguments:
    - Suppose a script is run with these arguments: ./script.sh arg1 arg2 arg3.
    ```bash
    Initially:
    
    $1 is arg1
    $2 is arg2
    $3 is arg3
    ```

- Using shift:
    - After shift is executed once:
    ```bash
    $1 now holds arg2
    $2 now holds arg3
    ```
    - Essentially, arg1 has been "shifted" out of the positional parameters.
    - You can use shift multiple times to keep discarding the first positional parameter each time.


## The script:
- Is named "add-newer-local-user.sh". (You change the name slightly to distinguish it
    from the previous script. NOTE: In the real world you could have easily kept the same script
    name. I just want to use a different name for the purpose of discussing specific scripts in the
    class.)
- Enforces that it be executed with superuser (root) privileges. If the script is not executed with
    superuser privileges it will not attempt to create a user and returns an exit status of 1. All
    messages associated with this event will be displayed on standard error.
- Provides a usage statement much like you would find in a man page if the user does not
    supply an account name on the command line and returns an exit status of 1. All messages
    associated with this event will be displayed on standard error.
- Automatically generates a password for the new account.
- Informs the user if the account was not able to be created for some reason. If the account is
    not created, the script is to return an exit status of 1. All messages associated with this event
- Displays the username, password, and host where the account was created. This way the
    help desk staff can copy the output of the script in order to easily deliver the information to
    the new account holder.
- Suppress the output from all other commands

## Pseudocode
- Flow of your script.
    1. Make sure the script is being executed with superuser privileges.
    2. If the user doesn't supply at least one argument, then give them help.
    3. The first parameter is the user name.
    4. The rest of the parameters are for the account comments.
    5. Generate a password.
    6. Create the user with the password.
    7. Check to see if the useradd command succeeded.
    8. Set the password.
    9. Check to see if the passwd command succeeded.
    10. Force password change on first login.
    11. Display the username, password, and the host where the user was created.