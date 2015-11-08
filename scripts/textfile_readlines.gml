//loops through all the buttons and gives them string values from the text file
for (var i = 0; i < buttonamount; i += 1)
{
    button_text[i] = file_text_readln(argument0);
}
file_text_close(argument0); //closes the text file
