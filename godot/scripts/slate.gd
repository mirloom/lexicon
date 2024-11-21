class_name Slate extends Container


@export var word_label: Label
@export var synonyms_label: Label


var _input_prefix: String
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	synonyms_label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _show_result(word: String, synonyms: PackedStringArray) -> void:
	word_label.text = word
	synonyms_label.text = Utils.array_to_string(synonyms, ", ")

## Signals


func _on_lexicon_word_started(start_chunk: String) -> void:
	_input_prefix = start_chunk
	word_label.text = _input_prefix
	synonyms_label.text = ""
	

func _on_lexicon_word_input(input: String) -> void:
	word_label.text = _input_prefix + input
	

func _on_lexicon_word_completed(word: String, clue_count: int, synonyms: PackedStringArray) -> void:	
	_show_result(word, synonyms)


func _on_lexicon_word_skipped(word: String, synonyms: PackedStringArray) -> void:
	_show_result(word, synonyms)
