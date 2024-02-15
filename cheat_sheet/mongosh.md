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

## Add a document to a new authors collection
`db.authors.insertOne({name: "John Ronald Reuel Tolkien", age: 81})`

## Insert multiple books to the books collection
`db.books.insertMany([{title: "Le Hobbit", author: "J. R. R. Tolkien", pages: 448, rating: 7, genres: ["fantasy", "roman"]},{title: "La Communauté de l'Anneau", author: "J. R. R. Tolkien", pages: 722, rating: 8, genres: ["fantasy", "roman"]}])`

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
### Find books by authors 
`db.books.find({author: "J. R. R. Tolkien"})`
`db.books.find({ author: "Andres Almiray" })`
### Find books by authors and rating
`db.books.find({author: "J. R. R. Tolkien", rating: 7})`
### Find books with a rating greater then 7
`db.books.find({rating: {$gt: 7}})`
### Find books with a rating lower then 8
`db.books.find({rating: {$lt: 8}})`
### Find books with a rating of 7 and J. R. R. Tolkien as an other
`db.books.find({$and: [{rating: 7}, {author: "J. R. R. Tolkien"}]})`
### Find books with a number of pages between of 300 and 400
`db.books.find({$and: [{pages: {$gt: 300}, pages: {$lt: 400}}]})`
### Find books with a number of pages in [722, 448]
`db.books.find({pages: {$in: [722, 448]}})`

## Delete documents
`db.books.deleteMany({author: "J. K. Rowling"})`
`db.books.find({author: "J. K. Rowling"}).count()`

## Update documents
`db.books.find({title: "Le Hobbit"}, {_id: 1, title: 1})` \
`db.books.updateOne({_id: ObjectId('65aac9ac314069fbfe0134ce')}, {$set: {rating: 10}})` \
`db.books.updateOne({_id: ObjectId('65aac9ac314069fbfe0134ce')}, {$inc: {rating: -1}})` \
`db.books.updateOne({_id: ObjectId('65aac9ac314069fbfe0134ce')}, {$push: {genres: "aventure"}})` \
`db.books.updateOne({_id: ObjectId('65aac9ac314069fbfe0134ce')}, {$pull: {genres: "roman"}})`
