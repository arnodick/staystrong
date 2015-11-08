//variable initilizations
buttonamount = textfile_length(file_text_open_read(argument0)); //sets the amount of buttons in the menu to the amount of lines of text in the text file
selection = 0; //which menu button is selected
selected_alpha = 1; //the alpha draw of a selected menu item
unselected_alpha = 0.2; //the alpha draw of an unselected menu item
button_alpha[buttonamount] = selected_alpha; //the alpha of each individual button (set to either selected_alpha or unselected_alpha during step)
button_text[buttonamount] = "A"; //the text of each individual button
lastturn[global.gamepadCount] = 0; //checks the control stick direction before moving selection, to stop it from checking every step
menu_pos = argument1; // the y position of the start of the menu
text_line = argument2; // the amount of pixels between lines in the menu

textfile_readlines(file_text_open_read(argument0)); //stores the menu titles in the array button_text
