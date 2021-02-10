$(function() {
  return $('#user_postal_code').jpostal({
    postal_code: ['#user_postal_code'],
    address: {
      '#user_postal_code': '%3',
      '#user_city': '%4',
      '#user_street': '%5%6%7',
    },
  })
})