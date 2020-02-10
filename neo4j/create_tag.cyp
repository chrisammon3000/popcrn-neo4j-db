// 03 Create Image, Tag nodes
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