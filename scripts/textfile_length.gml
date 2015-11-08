var file_length = 0;
//get the amount of lines in the text file
while (!file_text_eof(argument0)) //loops through file as long as last line hasn't been reached
{
    file_length += 1; //increments file length count for each line
    file_text_readln(argument0); //skips to next line
}
file_text_close(argument0); //closes the text file
return file_length; //returns the amount of lines in the text file
