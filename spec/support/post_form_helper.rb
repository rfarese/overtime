module PostFormHelper
  def fill_in_new_post_form
    fill_in 'post[date]', with: Date.today
    fill_in 'post[rationale]', with: "New post form rationale"
    click_on "Save"
  end

  def fill_in_edit_post_form
    fill_in 'post[date]', with: Date.yesterday
    fill_in 'post[rationale]', with: "Edit post form rationale"
    click_on "Save"
  end
end
