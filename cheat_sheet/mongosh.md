# Steps

## Sources
- https://www.mongodb.com/docs/

## Create databases
### List the databases
`show dbs`
### Create the book store database
`use bookstore`

## Add documents
### Add a document to a new books collection
`db.books.insertOne({title: "Harry Potter à l'école des sorciers", author: "J. K. Rowling", pages: 305, rating: 7, genres: ["fantasy", "roman"]})`

You will get back the id of the newly created document
```
{
  acknowledged: true,
  insertedId: ObjectId('65aac6bf314069fbfe0134cc')
}
```

## Sort data
### Count the books
`db.books.find().count()`
### Limit the output
`db.books.find().limit(2)`
### Sort by rating
Ascending: `db.books.find().sort({rating: 1})`\
Descending: `db.books.find().sort({rating: -1})`

## Find documents
### List books
`db.books.find()`
### Find books by status and page number
`db.books.find({status: "PUBLISH", pageCount: 300}).limit(2)`
### Find books with a number of page greater than 300
`db.books.find({pageCount: {$gt: 300}}).limit(2)`
### Find books with a pageCount lower than 400
`db.books.find({pageCount: {$lt: 400}}).limit(2)`
### Find books with a number of pages between of 300 and 400
`db.books.find({$and: [{pageCount: {$gt: 300}, pageCount: {$lt: 400}}]})`
### Find books by authors 
The wrong way: `db.books.find({ author: "Andres Almiray" })` \
The good way: `db.books.find({ authors: {$in: ["Andres Almiray"]} })`

Authors is an array, we need to use the $in query operator to query all documents where the authors field contain "Andres Almiray".

### Find books with a number of pages in [722, 448]
`db.books.find({pages: {$in: [722, 448]}}).limit(2)`

## Delete documents
`db.books.deleteMany({ authors: {$in: ["Andres Almiray"]} })`
`db.books.find({ authors: {$in: ["Andres Almiray"]} }).count()`

## Update documents
Find the document id: `db.books.find({title: "Open Source SOA"}, {_id: 1, title: 1})` \
`db.books.updateOne({_id: 68}, {$set: {pageCount: 10}})` \
`db.books.updateOne({_id: 68}, {$inc: {pageCount: -1}})` \
Adding to a list: `db.books.updateOne({_id: 68}, {$push: {categories: "aventure"}})` \
`db.books.find({_id: 68})` \
Removing from a list: `db.books.updateOne({_id: 68}, {$pull: {categories: "aventure"}})` \
`db.books.find({_id: 68})`
