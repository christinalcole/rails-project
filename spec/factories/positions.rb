FactoryBot.define do
  factory :position do
    name { ["main trim", "navigation", "jib trim", "tactics", "spin trim", "pit", "bow", "skipper"].sample }
  end
end
