// 03 Create Image, Tag nodes
LOAD CSV WITH HEADERS
FROM 'file:///media.csv' AS image_line
CREATE (image:Image { 
    imageId: '<imageId>',
    imageOwner: image_line.owner,
	imageCreatedDate: '<createdDate>',
    imageCaption: '<caption>',
    imageDescription: '<description>',
    imageURL: '<URL>'
    } );