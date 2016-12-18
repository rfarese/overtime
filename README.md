# Overtime

## Approval Workflow
- User enters a post, which is a time entry
- AdminUser reviews the post
- AdminUser approves or rejects the post
- Once approved, the post / record will be locked to avoid people being able to alter their hours
- If rejected, the post is sent back to the user that created the post
- Approval Summary Process:  Post -> Approval -> Lock Post
- Rejection Summary Process: Post -> Rejection -> Send Post to User/Creator 

## Todo for approval workflow
- Create a "status" attribute to post model and have it required
- "status" will have a default value
- Implement approval stages
- Locking for after approval
