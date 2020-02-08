// Read CSV
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS line

// Image node - media.csv
CREATE (image:Image { 
    imageId: '<int>',
    imageOwner: line.owner,
	imageCreatedDate: '<date>',
    imageCaption: '<str>',
    imageDescription: '<str>',
    })

// Tag node - media.csv
CREATE (tag:Tag { 
    tagId: '<int>',
    tagName: line.tags,
	tagCreatedDate: '<date>',
    tagCreatedBy: '<userHandle>',
    })
    