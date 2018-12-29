import React from 'react'

import {
  Form,
  Input,
  Select,
} from 'antd'

const FormItem = Form.Item
const { Option } = Select

class Account extends React.Component {
  handleSubmit = (e) => {
    e.preventDefault()
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        console.log('Received values of form: ', values)
      }
    });
  }

  render() {
    const { getFieldDecorator } = this.props.form

    return(
      <div className='container'>
        <div className='py-5 text-center'>
          <img className='d-block mx-auto mb-4' src='/docs/4.2/assets/brand/bootstrap-solid.svg' alt='' width='72'
               height='72' />
            <h2>Create your Masjid Account</h2>
            <p className='lead'>Below is an example form built entirely with Bootstrap’s form controls. Each required
              form group has a validation state that can be triggered by attempting to submit the form without
              completing it.</p>
        </div>

        <div className='row'>
          <div className='col-md-8 order-md-1'>
            <Form onSubmit={this.handleSubmit}>
              <FormItem
                label='Subdomain'
                className='mb-3'
              >
                {getFieldDecorator('subdomain', {
                  rules: [{
                    required: true,
                    message: 'Subdomain is required',
                  }],
                })(
                  <div className='input-group'>
                    <Input className='form-control' placeholder='Subdomain' />
                    <div className='input-group-prepend'>
                      <span className='input-group-text'>.theopenmasjid.com</span>
                    </div>
                  </div>
                )}
              </FormItem>

              <FormItem
                label='E-mail Address'
                className='mb-3'
              >
                {getFieldDecorator('email', {
                  rules: [{
                    type: 'email',
                    message: 'E-mail Address is invalid',
                  }, {
                    required: true,
                    message: 'E-mail Address is required',
                  }],
                })(
                  <Input className='form-control' placeholder='E-mail Address' />
                )}
              </FormItem>

              <FormItem
                label='Mosque Name'
                className='mb-3'
              >
                {getFieldDecorator('mosque', {
                  rules: [{
                    required: true,
                    message: 'Mosque Name is required',
                  }],
                })(
                  <Input className='form-control' placeholder='Mosque Name' />
                )}
              </FormItem>

              <FormItem
                label='Responsable Name'
                className='mb-3'
              >
                {getFieldDecorator('responsable', {
                  rules: [{
                    required: true,
                    message: 'Responsable Name is required',
                  }],
                })(
                  <Input className='form-control' placeholder='Responsable Name' />
                )}
              </FormItem>

              <div className='row'>
                <FormItem
                  label='Address'
                  className='col-md-9 mb-3'
                >
                  {getFieldDecorator('address', {
                    rules: [{
                      required: true,
                      message: 'Address is required',
                    }],
                  })(
                    <Input className='form-control' placeholder='Address' />
                  )}
                </FormItem>

                <FormItem
                  label='Zip'
                  className='col-md-3 mb-3'
                >
                  {getFieldDecorator('zipcode', {
                    rules: [{
                      required: true,
                      message: 'Zip is required',
                    }],
                  })(
                    <Input className='form-control' placeholder='Zip' />
                  )}
                </FormItem>
              </div>

              <div className='row'>
                <FormItem
                  label='Country'
                  className='col-md-5 mb-3'
                >
                  {getFieldDecorator('country_id', {
                    rules: [{
                      required: true,
                      message: 'Country is required',
                    }],
                  })(
                    <Select
                      placeholder='Please select a country'
                      className='custom-select d-block w-100'
                    >
                      <Option value='usa'>United States</Option>
                    </Select>
                  )}
                </FormItem>

                <FormItem
                  label='State'
                  className='col-md-4 mb-3'
                >
                  {getFieldDecorator('region_id', {
                    rules: [{
                      required: true,
                      message: 'State is required',
                    }],
                  })(
                    <Select
                      placeholder='Please select a state'
                      className='custom-select d-block w-100'
                    >
                      <Option value='california'>California</Option>
                    </Select>
                  )}
                </FormItem>

                <FormItem
                  label='City'
                  className='col-md-3 mb-3'
                >
                  {getFieldDecorator('city_id', {
                    rules: [{
                      required: true,
                      message: 'City is required',
                    }],
                  })(
                    <Select
                      placeholder='Please select a city'
                      className='custom-select d-block w-100'
                    >
                      <Option value='california'>California</Option>
                    </Select>
                  )}
                </FormItem>
              </div>

              <hr className='mb-4'></hr>

              <button className='btn btn-primary btn-lg btn-block btn-submit' type='submit'>Create Account</button>
            </Form>
          </div>
        </div>
      </div>
    )
  }
}
export default Form.create()(Account)