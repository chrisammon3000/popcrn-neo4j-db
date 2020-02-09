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
    } );