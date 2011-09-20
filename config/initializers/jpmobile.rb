ActiveSupport.on_load(:after_initialize) do
  Jpmobile::SessionID.extend ActionDispatch::Session::Compatibility
end

