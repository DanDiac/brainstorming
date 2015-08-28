$("#members_list").html("<%= escape_javascript(render partial: '/meetings/members_list' ) %>")
$("#invitations_form").html("<%= escape_javascript(render partial: '/meetings/invitation_form' ) %>")