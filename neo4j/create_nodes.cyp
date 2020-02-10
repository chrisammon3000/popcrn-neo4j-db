// Full Query
LOAD CSV WITH HEADERS
FROM 'file:///profile.csv' AS profile_line
CREATE (user:User { 
    userId: profile_line.User,
    userHandle: '@' + trim(profile_line.handle),
	userSiteName:profile_line.SiteName,
    userFirstName: profile_line.FirstName,
    userLastName: profile_line.LastName,
    userEmail: profile_line.email,
    userPassword: profile_line.password,
    userGender: profile_line.Gender,
    userBio: profile_line.experience,
    userProfile_FG: profile_line.profile_fg,
    userProfile_BG: profile_line.profile_bg 
    } )

// User FOLLOWS user
WITH profile_line, split(profile_line.following_users, ',') AS followers
UNWIND followers AS follower
MERGE (user:User { userHandle: '@'+profile_line.handle })
WITH user, follower
MATCH (f:User { userHandle: follower })
MERGE (f)-[r:FOLLOWS]->(user)
SET r.followedDate = '<date>';

// Create Project nodes
WITH max(1) AS dummy
LOAD CSV WITH HEADERS
FROM 'file:///project.csv' AS project_line
CREATE (project:Project { 
    projectId: project_line.projectid,
    projectName: project_line.name,
	projectCreatedBy: '<userHandle>',
    projectDescription: project_line.description,
    projectCreatedDate: project_line.date
    } )

// User :WORKED_ON Project
WITH project_line, 
	split(trim(project_line.users), ',') AS collaborators, 
    project_line.projectid AS project_Id
UNWIND collaborators AS collaborator
MATCH (user:User { userHandle: collaborator} ),
	(project:Project { projectId: project_Id })
MERGE (user)-[rel:WORKED_ON]->(project)
SET rel.workedOnDate = '<date>', 
	rel.userRoles = ['<role 1>', '<role 2>'];

// User FOLLOWS Project, Tag
// data not available

// User LIKES Project
// data not available

// Create Image & Tag nodes
WITH max(1) AS dummy
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS image_line

// Image nodes
CREATE (image:Image { 
    imageId: '<imageId>',
    imageOwner: '@'+image_line.owner,
	imageCreatedDate: '<createdDate>',
    imageCaption: '<caption>',
    imageDescription: '<description>',
    imageURL: image_line.url
    } )

// Tag nodes
WITH image_line, split(image_line.tags, ',') AS tagnames
UNWIND tagnames AS tagname
WITH DISTINCT tagname AS tag_node
CREATE (tag:Tag { 
    tagId: '<tagId>',
    tagName: tag_node,
	tagCreatedDate: '<createdDate>',
    tagCreatedBy: '<userHandle>'
    } );

// User :CREATED Image
MATCH (user:User), (image:Image)
WHERE user.userHandle = image.imageOwner
MERGE (user)-[rel:CREATED]->(image) SET rel.createdDate = date()

// User LIKES Image
// data not available

// User IS_TAGGED_IN Image
// data not available

// 03 Create Tag nodes
// WITH max(1) AS dummy
// LOAD CSV WITH HEADERS
// FROM 'file:///media.csv' AS tag_line
/////

// Image IS_TAGGED Project


// Image IS_TAGGED Project


// Project IS_TAGGED Tag
// data not avaiable

// Constraints

