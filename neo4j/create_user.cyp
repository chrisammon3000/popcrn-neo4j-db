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
    } );