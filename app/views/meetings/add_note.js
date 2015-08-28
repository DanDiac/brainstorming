$("#note_form").html("<%= escape_javascript(render partial: '/meetings/add_note' ) %>")
$("#notes_list").html("<%= escape_javascript(render partial: '/meetings/notes_list' ) %>")