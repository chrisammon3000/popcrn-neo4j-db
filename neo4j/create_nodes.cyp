// 01 Create User nodes
LOAD CSV WITH HEADERS
FROM 'file:///profile.csv' AS line
CREATE (user:User { 
    userId: line.User,
    userHandle: '@' + line.handle,
	userSiteName:line.SiteName,
    userFirstName: line.FirstName,
    userLastName: line.LastName,
    userEmail: line.email,
    userPassword: line.password,
    userGender: line.Gender,
    userBio: line.experience,
    userProfile_FG: line.profile_fg,
    userProfile_BG: line.profile_bg 
    })

// 02 Create Project nodes
LOAD CSV WITH HEADERS
FROM 'file:///project.csv' AS line
CREATE (project:Project { 
    projectId: line.projectId,
    projectName: line.name,
	projectCreatedBy: '<userHandle>',
    projectDescription: line.description,
    projectCreatedDate: line.date
    } )

// 03 Create Image, Tag nodes
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS line
CREATE (image:Image { 
    imageId: '<imageId>',
    imageOwner: line.owner,
	imageCreatedDate: '<createdDate>',
    imageCaption: '<caption>',
    imageDescription: '<description>',
    imageURL: '<URL>'
    } )
WITH line, split(line.tags, ',') AS tagnames
UNWIND tagnames AS tagname
WITH DISTINCT tagname AS tag_node
CREATE (tag:Tag { 
    tagId: '<tagId>',
    tagName: tag_node,
	tagCreatedDate: '<createdDate>',
    tagCreatedBy: '<userHandle>'
    } )