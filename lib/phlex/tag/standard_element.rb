# frozen_string_literal: true

module Phlex
  class Tag
    class StandardElement < Tag
      include Node

      ELEMENTS = %w[
        a
        abbr
        address
        article
        aside
        b
        bdi
        bdo
        blockquote
        body
        button
        caption
        cite
        code
        colgroup
        data
        datalist
        dd
        del
        details
        dfn
        dialog
        div
        dl
        dt
        em
        fieldset
        figcaption
        figure
        footer
        form
        h1
        h2
        h3
        h4
        h5
        h6
        head
        header
        html
        i
        iframe
        ins
        kbd
        label
        legend
        li
        main
        map
        mark
        menuitem
        meter
        nav
        noscript
        object
        ol
        optgroup
        option
        output
        p
        picture
        pre
        progress
        q
        rp
        rt
        ruby
        s
        samp
        script
        section
        select
        slot
        small
        span
        strong
        sub
        summary
        sup
        table
        tbody
        td
        textarea
        tfoot
        th
        thead
        time
        title
        tr
        u
        ul
        video
        wbr
      ].freeze

      def call(buffer = String.new)
        buffer << "<" << name << attributes << ">"
        super
        buffer << "</" << name << ">"
      end
    end
  end
end
