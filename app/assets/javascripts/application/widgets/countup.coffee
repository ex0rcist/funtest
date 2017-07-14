Vue.component('countup', {
  template: '<span>{{number}}</span>',

  props: ['number']

  methods:
    transform: (oldNumber, newNumber) ->
      options = {
        useEasing: true,
        useGrouping: true,
        separator: ',',
        decimal: '.',
        decimals: 3,
        prefix: '',
        suffix: ''
      };

      countup = new CountUp($(this.$el)[0], oldNumber, newNumber, this.getPrecision(newNumber), 1.5, options)
      countup.start()

    getPrecision: (a) ->
      if !isFinite(a)
        return 0
      e = 1
      p = 0
      while Math.round(a * e) / e != a
        e *= 10
        p++
      p

  watch:
    number: (newNumber, oldNumber) ->
      this.transform(oldNumber, newNumber)

})