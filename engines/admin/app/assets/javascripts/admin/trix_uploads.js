// Turn off the default Trix captions
Trix.config.attachments.preview.caption = {
  name: false,
  size: false
}

function uploadAttachment(attachment) {
  var file = attachment.file

  if (file) {
    var upload = new window.ActiveStorage.DirectUpload(file, '/rails/active_storage/direct_uploads', window)

    upload.create((error, attributes) => {
      if (error) {
        throw new Error(`Direct upload failed: ${error}`)
      }

      // Tell Trix what url and href to use on successful upload
      return attachment.setAttributes({
        url: `/rails/active_storage/blobs/${attributes.signed_id}/${attributes.filename}`,
        href: `/rails/active_storage/blobs/${attributes.signed_id}/${attributes.filename}`,
      })
    })
  }
}

// Listen for the Trix attachment event to trigger upload
document.addEventListener('trix-attachment-add', function(event) {
  var attachment = event.attachment
  if (attachment.file) {
    return uploadAttachment(attachment)
  }
})

// Listen for the Trix attachment event to trigger removal
document.addEventListener('trix-attachment-remove', function(event) {
  var attachment = event.attachment
  if (attachment.file) {
    console.log('trix-attachment-remove TRIGGERED')
    console.log(attachment.file)
  }
})
