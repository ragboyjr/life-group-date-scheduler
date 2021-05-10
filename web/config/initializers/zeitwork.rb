Rails.autoloaders.each do |autoloader|
  autoloader.inflector.inflect(
    'lgds' => 'LGDS',
  )
end