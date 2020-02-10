// 02 Create Project nodes
LOAD CSV WITH HEADERS
FROM 'file:///project.csv' AS project_line
CREATE (project:Project { 
    projectId: project_line.projectId,
    projectName: project_line.name,
	projectCreatedBy: '<userHandle>',
    projectDescription: project_line.description,
    projectCreatedDate: project_line.date
    } );