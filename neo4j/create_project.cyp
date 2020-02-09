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