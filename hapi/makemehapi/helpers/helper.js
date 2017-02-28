module.exports = (context) => {
  const query = context.data.root.query;
  return query.name + query.suffix;
};
