$ ->
  window.adminApp = new Vue({
    el: '#admin-application'

    data: {
      rate: Cookies.get('last_rate')
      date: Cookies.get('last_date')

      errors:
        rate: ''
        date: ''

      status: null
      loading: false
    }

    methods:
      submit: ->
        this.loading = true
        this.status = null

        $.ajax(
          type: 'PUT'
          url: '/admin/rate'
          data: {rate: this.rate, date: this.date}

          success: (msg) =>
            this.status = 'Успешно!'
            this.loading = false
            this.errors = {rate: '', date: ''}
            # todo: cookie!
            setTimeout((=> this.status = ''), 2000)

            Cookies.set('last_rate', this.rate)
            Cookies.set('last_date', this.date)

          error: (err) =>
            try
              this.errors = $.parseJSON(err.responseText)

            this.loading = false

          dataType: 'json'
        )

  })

