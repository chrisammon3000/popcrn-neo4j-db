// 03 Create Image, Tag nodes
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS line
WITH line, split(line.tags, ',') AS tagnames
UNWIND tagnames AS tagname
WITH DISTINCT tagname AS tag_node
CREATE (tag:Tag { 
    tagId: '<tagId>',
    tagName: tag_node,
	tagCreatedDate: '<createdDate>',
    tagCreatedBy: '<userHandle>'
    } );