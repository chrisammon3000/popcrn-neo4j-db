





// User FOLLOWS user
WITH line, split(line.following_users, ',') AS followers
UNWIND followers AS follower
MERGE (user:User { userHandle: '@'+line.handle })
WITH user, follower
MATCH (f:User { userHandle: follower })
CREATE (f)-[r:FOLLOWS]->(user)


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
