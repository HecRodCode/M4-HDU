// use StreamHub;

// 1. data insert

// users
db.users.insertMany([
  {
    username: 'alice_99',
    email: 'alice@mail.com',
    plan: 'Basic',
    history_count: 3,
  },
  {
    username: 'bob_stream',
    email: 'bob@mail.com',
    plan: 'Premium',
    history_count: 8,
  },
  {
    username: 'charlie_tech',
    email: 'char@mail.com',
    plan: 'Standard',
    history_count: 15,
  },
]);

// content
db.content.insertMany([
  {
    title: 'Inception',
    type: 'movie',
    duration_mins: 148,
    genres: ['Sci-Fi', 'Action'],
    release_year: 2010,
  },
  {
    title: 'The Bear',
    type: 'series',
    seasons: 3,
    genres: ['Drama', 'Comedy'],
    release_year: 2022,
  },
  {
    title: 'Toy Story',
    type: 'movie',
    duration_mins: 81,
    genres: ['Animation'],
    release_year: 1995,
  },
]);

// ratings
db.ratings.insertOne({
  username: 'alice_99',
  content_title: 'Inception',
  score: 5,
  comment: 'Amazing plot!',
  date: new Date(),
});

// 2.consultations with operators

// films longer than 120 minutes ($gt)
db.content.find({ duration_mins: { $gt: 120 } });

// Users with a history of < 5
db.users.find({ history_count: { $lt: 5 } });

// search content by exact gender ($in)
db.content.find({
  genres: { $in: ['Sci-Fi'] },
});

// drama movies from years ago ($and + $eq)
db.content.find({
  $and: [{ type: { $eq: 'movie' } }, { genres: { $in: ['Drama'] } }],
});

// search by partial name
db.content.find({
  title: { $regex: 'Star', $options: 'i' },
});

// 3. Updates and Deletions

// update a user's plan (updateOne)
db.users.updateOne({ username: 'alice_99' }, { $set: { plan: 'Premium' } });

// update the rating of a piece of content (updateMany)
db.content.updateMany(
  { type: 'series', genres: 'Drama' },
  { $set: { rating: 5.0 } }
);

// delete a specific rating (deleteOne)
db.ratings.deleteOne({ username: 'alice_99', content_title: 'Inception' });

// Delete old content (deleteMany)
db.content.deleteMany({ release_year: { $lt: 1990 } });

// 4. Indexs

// index for quickly searching movie titles
db.content.createIndex({ title: 1 });

// index for searching users by email (unique)
db.users.createIndex({ email: 1 }, { unique: true });

// View created indexes
db.content.getIndexes();

// 5. aggregations

// Count how many pieces of content there are of each type (Movies vs. Series)
db.content.aggregate([
  { $group: { _id: '$type', total: { $sum: 1 } } },
  { $sort: { total: -1 } },
]);

// average duration for movies only
db.content.aggregate([
  { $match: { type: 'movie' } },
  { $group: { _id: null, promedio_duracion: { $avg: '$duration_mins' } } },
  { $project: { _id: 0, promedio_duracion: 1 } },
]);
