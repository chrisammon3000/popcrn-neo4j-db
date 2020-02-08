// Read CSV
LOAD CSV WITH HEADERS
FROM 'file:///project.csv' AS line

// Project node - project.csv
CREATE (project:Project { 
    projectId: line.projectId,
    projectName: line.name,
	projectCreatedBy: '<userHandle>',
    projectDescription: line.description,
    projectCreatedDate: line.date, 
    })