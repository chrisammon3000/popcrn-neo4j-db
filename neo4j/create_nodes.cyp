// Create User nodes
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
    } )

// Create Project nodes
LOAD CSV WITH HEADERS
FROM 'file:///project.csv' AS line
CREATE (project:Project { 
    projectId: line.projectId,
    projectName: line.name,
	projectCreatedBy: '<userHandle>',
    projectDescription: line.description,
    projectCreatedDate: line.date
    } )

// Create Image, Tag nodes
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS line
CREATE (image:Image { 
    imageId: '<int>',
    imageOwner: line.owner,
	imageCreatedDate: '<date>',
    imageCaption: '<str>',
    imageDescription: '<str>',
    imageURL: '<URL>'
    } )
CREATE (tag:Tag { 
    tagId: '<int>',
    tagName: line.tags,
	tagCreatedDate: '<date>',
    tagCreatedBy: '<userHandle>'
    } )