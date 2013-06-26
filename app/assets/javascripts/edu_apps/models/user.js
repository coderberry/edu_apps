var User = DS.Model.extend(Ember.Validations.Mixin, {

  // attributes
  email:                   DS.attr('string'),
  access_token:            DS.attr('string'),
  name:                    DS.attr('string'),
  organization_name:       DS.attr('string'),
  password:                DS.attr('string'),
  passwordConfirmation:    DS.attr('string'),
  is_anonymous_tools_only: DS.attr('boolean'),
  is_auto_approve_tools:   DS.attr('boolean'),

  // validations
  validations: {
    email: { format: /.+@.+\..{2,4}/ },
    password: {
      length: { minimum: 6 },
      confirmation: { message: 'must match the password confirmation field' }
    },
    organization_name: {
      presence: true
    }
  },

  // callbacks

  becameError: function() {
    // handle error case here
    console.log('there was an error!');
  },

  becameInvalid: function(model) {
    // This is needed in order for the validations mixin to work with the rails controller response.
    model.set('errors', Ember.Object.create(model.errors));
    console.log("Record was invalid because: " + model.get('errors'));
  }

});

module.exports = User;

