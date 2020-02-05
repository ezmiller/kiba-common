require_relative 'helper'
require 'kiba-common/transforms/source_transform_adapter'
require_relative 'support/test_keyword_proxy_source'
require_relative 'support/test_hash_configured_object'

class TestSourceTransformAdapter < Minitest::Test
  include Kiba::Common::Sources
  include Kiba::DSLExtensions

  def test_instantiation
    rows = []
    job = Kiba.parse do
      extend Config
      config :kiba, runner: Kiba::StreamingRunner

      source Enumerable, [
        [ Enumerable, (1..10) ],
        [ Enumerable, (11..20) ]
      ]
      transform Kiba::Common::Transforms::SourceTransformAdapter
      destination TestArrayDestination, rows
    end
    Kiba.run(job)
    assert_equal (1..20).to_a, rows
  end
  
  def test_instantiation_keyword_arguments
    rows = []
    job = Kiba.parse do
      source Enumerable, [
        # Test against a class that expects explicit keyword arguments
        [ TestKeywordProxySource, {mandatory: "some value"} ]
      ]
      transform Kiba::Common::Transforms::SourceTransformAdapter
      destination TestArrayDestination, rows
    end
    Kiba.run(job)
    assert_equal([
      {mandatory: "some value", optional: nil}
    ], rows)
  end
  
  def test_hash_configured_object
    rows = []
    job = Kiba.parse do
      source Enumerable, [
        # Test against a class that takes a single Hash argument
        [ TestHashConfiguredObject, {mandatory: "some value"} ]
      ]
      transform Kiba::Common::Transforms::SourceTransformAdapter
      destination TestArrayDestination, rows
    end
    Kiba.run(job)
    assert_equal([
      {mandatory: "some value"}
    ], rows)
  end
end
