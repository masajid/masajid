module Content
  module ScopedTo
    def scoped_to(account)
      where(account_id: account.id)
    end
  end
end

# todo in model: extend Subscribem::ScopedTo
