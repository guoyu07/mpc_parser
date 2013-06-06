# -*- encoding : utf-8 -*-

namespace :dianping do

  desc "load dianping data"
  task :load_data => :environment do
    puts "Start load dianping data"

    # truncate merchants
    ActiveRecord::Base.connection.execute("TRUNCATE merchants")

    shop_path = "doc/dianping1.csv"
    File.open(shop_path,"r").each_with_index do |line, index|
      #break if index > 10
      #主店名称， 分店名称，地址，商户类型，道路名称，行政区名称
      shopname_main,shopname_branch,shopaddress,shoptype_main,road_main,eara_main = shopselect(line)
      #:address, :area_name, :brand, :branch, :latitude, :longitude, :mid, :road_name, :tag
      Merchant.create(brand: shopname_main,
                      branch: shopname_branch,
                      address: shopaddress,
                      tag: shoptype_main,
                      road_name: road_main,
                      area_name: eara_main)
    end

    puts "End load dianping data"
  end


  #括号里面的是传进来的数据
  def shopselect(line)
    ss = line.strip.split(/,/)         #用，将第一行分割开来
    return if ss.length != 4             #如果是分成四份就ok 如果是少于四份就舍弃
    shopname = ss[0].strip.split(/\(/) #将分开来的第一个字段在分割（品牌名和分店名）

    if shopname.length == 2
      shopname_main = shopname[0]
      shopname_branch = shopname[1].gsub(/店\)/,'')
      shopname_branch = shopname_branch.gsub(/\)分店/,'')                #这个“\”表示转意 
      shopname_branch = shopname_branch.gsub(/分店/,'')           
    else
      shopname_main = shopname[0].strip       
    end

    words = Word.all
    words.each do |word| 
      shopname_main = shopname_main.gsub(word.name.strip,'') 
    end

    shopaddress = ss[1]            #要从地址中取出来道路名和区域名
    eara_main=""
    areas = Area.all
    areas.each do |area|
        eara_main=shopaddress[area.name.strip]
        next if eara_main.nil?                  #判断是不是空的，如果是空的那就不要用 如果是

        if eara_main.length > 0            
          break
        end
    end

    road_main=""
    roads = Road.all
    roads.each do |road|
      if road.name.length > 2
        road_main=shopaddress[road.name.strip]
        next if road_main.nil?
                    
        if road_main.length >0            
            break
        end
      end
    end

    shoptelephone = ss[2]           #电话号码是不要的 所以要舍弃掉   
    shoptype = ss[3].strip.split(/\//)               
    shoptype_main = shoptype[0]

    #puts "#{shopname_main}\t\t#{shopname_branch}\t\t#{eara_main}\t\t#{road_main}\t\t#{shopaddress}\t\t#{shoptype_main}"

    return [shopname_main,shopname_branch,shopaddress,shoptype_main,road_main,eara_main]
  end



end