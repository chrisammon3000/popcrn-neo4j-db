// Create User nodes
LOAD CSV WITH HEADERS
FROM 'file:///profile.csv' AS profile_line
CREATE (user:User { 
    userId: profile_line.User,
    userHandle: '@' + profile_line.handle,
	userSiteName:profile_line.SiteName,
    userFirstName: profile_line.FirstName,
    userLastName: profile_line.LastName,
    userEmail: profile_line.email,
    userPassword: profile_line.password,
    userGender: profile_line.Gender,
    userBio: profile_line.experience,
    userProfile_FG: profile_line.profile_fg,
    userProfile_BG: profile_line.profile_bg 
    } );

// User FOLLOWS user
WITH profile_line, split(profile_line.following_users, ',') AS followers
UNWIND followers AS follower
MERGE (user:User { userHandle: '@'+profile_line.handle })
WITH user, follower
MATCH (f:User { userHandle: follower })
CREATE (f)-[r:FOLLOWS]->(user)

// 02 Create Project nodes
WITH max(1) AS dummy
LOAD CSV WITH HEADERS
FROM 'file:///project.csv' AS project_line
CREATE (project:Project { 
    projectId: project_line.projectId,
    projectName: project_line.name,
	projectCreatedBy: '<userHandle>',
    projectDescription: project_line.description,
    projectCreatedDate: project_line.date
    } );

// 03 Create Image nodes
WITH max(1) AS dummy
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS image_line
CREATE (image:Image { 
    imageId: '<imageId>',
    imageOwner: image_line.owner,
	imageCreatedDate: '<createdDate>',
    imageCaption: '<caption>',
    imageDescription: '<description>',
    imageURL: '<URL>'
    } );

// 03 Create Tag nodes
WITH max(1) AS dummy
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS tag_line
WITH tag_line, split(tag_line.tags, ',') AS tagnames
UNWIND tagnames AS tagname
WITH DISTINCT tagname AS tag_node
CREATE (tag:Tag { 
    tagId: '<tagId>',
    tagName: tag_node,
	tagCreatedDate: '<createdDate>',
    tagCreatedBy: '<userHandle>'
    } );




// User WORKED_ON on Project

// User FOLLOWS Project, Tag

// User LIKES Project

// User CREATED Project

// User CREATED Image

// User LIKES Image

// User IS_TAGGED_IN Image

// Image IS_TAGGED Project, Tag

// Project IS_TAGGED Tag

// Constraints




// # Create user nodes
// user_nodes = "LOAD CSV WITH HEADERS FROM 'file:///profile.csv' AS line CREATE (user:User { 
// 	userId: toInteger(line.User),
//     userHandle: '@' + line.handle,
// 	userSiteName: line.SiteName,
//     userFirstName: line.FirstName,
//     userLastName: line.LastName,
//     userEmail: line.email,
//     userPassword: line.password,
//     userGender: line.Gender,
//     userBio: line.experience,
//     userProfile_FG: line.profile_fg,
//     userProfile_BG: line.profile_bg
//     })"


// merge_followers = 'LOAD CSV WITH HEADERS
//     FROM 'file:///profile.csv' AS line
//     WITH line, split(line.following_users, ',') AS followers
//     UNWIND followers AS follower
//     MERGE (user:User { userHandle: '@'+line.handle })
//     WITH user, follower
//     MATCH (f:User { userHandle: follower })
//     MERGE (f)-[r:FOLLOWS]->(user)
//     RETURN user, r, f'
