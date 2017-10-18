PgSearch.multisearch_options = {
    :using => {:tsearch => {dictionary: 'portuguese', prefix: true, any_word: true},
               :dmetaphone => {},
               :trigram => {threshold: 0.5}},
    :ignoring => :accents
}
