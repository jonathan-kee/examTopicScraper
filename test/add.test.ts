import t from 'tap'
const add = require('./add')

t.test('throw when inputs are not numbers', async t => {
  t.throws(() => add('5', '5'), Error('inputs must be numbers'))
  t.throws(() => add(5, '5'), Error('inputs must be numbers'))
  t.throws(() => add('5', 5), Error('inputs must be numbers'))
  t.throws(() => add({}, null), Error('inputs must be numbers'))
})

t.test('adds two numbers', async t => {
  t.equal(add(5, 5), 10)
  t.equal(add(-5, 5), 0)
})
