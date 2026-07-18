import t from 'tap'

function add(arg1: any, arg2: any) {
  if (!Number.isInteger(arg1)) throw Error('inputs must be numbers');
  if (!Number.isInteger(arg2)) throw Error('inputs must be numbers');
  return arg1 + arg2;
}

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
