import React from 'react'

import {
  Form,
  Input,
} from 'antd'

const FormItem = Form.Item

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

    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 8 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 16 },
      },
    }

    const tailFormItemLayout = {
      wrapperCol: {
        xs: {
          span: 24,
          offset: 0,
        },
        sm: {
          span: 16,
          offset: 8,
        },
      },
    }

    return(
      <div className="container">
        <div className="py-5 text-center">
          <img className="d-block mx-auto mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72"
               height="72" />
            <h2>Create your Masjid Account</h2>
            <p className="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required
              form group has a validation state that can be triggered by attempting to submit the form without
              completing it.</p>
        </div>

        <div className="row">
          <div className="col-md-8 order-md-1">
            <Form className="needs-validation" noValidate onSubmit={this.handleSubmit}>
              <FormItem
                label="Subdomain"
                className="mb-3"
              >
                {getFieldDecorator('subdomain', {
                  rules: [{
                    required: true,
                    message: 'Please enter a subdomain!',
                  }],
                })(
                  <Input className="form-control" placeholder="Subdomain" />
                )}
              </FormItem>

              <FormItem
                label="E-mail address"
                className="mb-3"
              >
                {getFieldDecorator('email', {
                  rules: [{
                    type: 'email',
                    message: 'The input is not a valid E-mail!',
                  }, {
                    required: true,
                    message: 'Please input your E-mail!',
                  }],
                })(
                  <Input className="form-control" placeholder="E-mail address" />
                )}
              </FormItem>

              <FormItem
                label="Mosque name"
                className="mb-3"
              >
                {getFieldDecorator('mosque', {
                  rules: [{
                    required: true,
                    message: 'Please enter the mosque name!',
                  }],
                })(
                  <Input className="form-control" placeholder="Mosque name" />
                )}
              </FormItem>

              <FormItem
                label="Responsable name"
                className="mb-3"
              >
                {getFieldDecorator('responsable', {
                  rules: [{
                    required: true,
                    message: 'Please enter the responsable name!',
                  }],
                })(
                  <Input className="form-control" placeholder="Responsable name" />
                )}
              </FormItem>

              <FormItem
                label="Address"
                className="mb-3"
              >
                {getFieldDecorator('address', {
                  rules: [{
                    required: true,
                    message: 'Please enter the mosque address!',
                  }],
                })(
                  <Input className="form-control" placeholder="Address" />
                )}
              </FormItem>

              <hr className="mb-4"></hr>

              <button className="btn btn-primary btn-lg btn-block" type="submit">Create Account</button>
            </Form>
          </div>
        </div>
      </div>
    )
  }
}
export default Form.create()(Account)