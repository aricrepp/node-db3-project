const db = require('../data/config');

function find() {
  return db('schemes');
}

function findById(id) {
  return db('schemes').where('id', id);
}

function findSteps(id) {
  return db('schemes')
    .select('scheme_id', 'scheme_name', 'step_number', 'instructions')
    .join('steps', 'steps.scheme_id', '=', 'schemes.id')
    .where({ scheme_id: id })
    .orderBy('step_number');
}

function add(scheme) {
  return db('schemes')
    .insert(scheme, 'id')
    .then(([id]) => findById(id));
}

function update(changes, id) {
  return db('schemes').where({ id }).update(changes);
}

function remove(id) {
  return db('schemes').where({ id }).delete();
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};
