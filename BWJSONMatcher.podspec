Pod::Spec.new do |s|
  s.name         	= "BWJSONMatcher"
  s.version      	= "1.0.2"
  s.summary      	= "BWJSONMatcher helps you easily match a JSON string or JSON object up with your data model"
  s.homepage     	= "https://github.com/BurrowsWang/BWJSONMatcher"
  s.license      	= { :type => 'MIT' }
  s.author       	= { "BurrowsWang" => "burrowswang@gmail.com" }
  s.platform     	= :ios, "6.0"
  s.source       	= { :git => "https://github.com/BurrowsWang/BWJSONMatcher.git", :tag => s.version.to_s }
  s.source_files = 'BWJSONMatcher/*.{h,m,c}'
  s.requires_arc 	= true
  
end
