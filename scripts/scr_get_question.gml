//Gets a random question from the questions book.

var json = file_text_open_read("questions.json");
var data = "";

while (!file_text_eof(json)) {
    data += file_text_read_string(json);
    file_text_readln(json);
}

file_text_close(json);

var json_map = json_decode(data);
var list = ds_map_find_value(json_map, "default");
var question_number = irandom_range(0, 12);

var entry = ds_list_find_value(list, question_number);
question = entry[? "question"];
correct_answer = entry[? "correct_answer"];

var answers = entry[? "answers"];
for (var i = 0; i < ds_list_size(answers); i++) {
    answer[i] = ds_list_find_value(answers, i);
}
