import React from 'react'

import {
  Form,
  Input,
} from 'antd'

const FormItem = Form.Item

class Account extends React.Component {
  componentDidMount () {
    // Background Parallax
    $('.account-area').parallax("50%", -0.5);
  }

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
      <section className="account-area overlay section-padding" id="account-page">
        <div className="container">
          <div className="row">
            <div className="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
              <div className="page-title">
                <h2>Create Account</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit voluptates, temporibus at, facere harum fugiat!</p>
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-xs-12 col-md-12">
              <Form onSubmit={this.handleSubmit}>
                <FormItem {...formItemLayout}>
                  {getFieldDecorator('subdomain', {
                    rules: [{
                      required: true,
                      message: 'Please enter a subdomain!',
                    }],
                  })(
                    <Input className="form-control" placeholder="Subdomain" />
                  )}
                </FormItem>

                <FormItem {...formItemLayout}>
                  {getFieldDecorator('email', {
                    rules: [{
                      type: 'email',
                      message: 'The input is not valid E-mail!',
                    }, {
                      required: true,
                      message: 'Please input your E-mail!',
                    }],
                  })(
                    <Input className="form-control" placeholder="E-mail address" />
                  )}
                </FormItem>

                <FormItem {...formItemLayout}>
                  {getFieldDecorator('mosque', {
                    rules: [{
                      required: true,
                      message: 'Please enter the mosque name!',
                    }],
                  })(
                    <Input className="form-control" placeholder="Mosque name" />
                  )}
                </FormItem>

                <FormItem {...formItemLayout}>
                  {getFieldDecorator('responsable', {
                    rules: [{
                      required: true,
                      message: 'Please enter the responsable name!',
                    }],
                  })(
                    <Input className="form-control" placeholder="Responsable name" />
                  )}
                </FormItem>

                <FormItem {...formItemLayout}>
                  {getFieldDecorator('address', {
                    rules: [{
                      required: true,
                      message: 'Please enter the mosque address!',
                    }],
                  })(
                    <Input className="form-control" placeholder="Address" />
                  )}
                </FormItem>

              </Form>
            </div>
          </div>
        </div>
      </section>
    )
  }
}
export default Form.create()(Account)